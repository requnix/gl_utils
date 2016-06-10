source = "./defines.txt"
dest = "./src/gl_const.erl"
header = ["-module(gl_const).\n", "-compile(export_all).\n", "\n", "-include_lib(\"wx/include/gl.hrl\").\n", "\n"]
name_regex = ~r/(?<=\-define\()(?:.*?)(?=\,)/

File.rm(dest)
File.touch(dest)

file_in = File.stream!(source, [encoding: :utf8])
file_out = File.stream!(dest, [{:encoding, :utf8}, :delayed_write, :append])

parse_match = fn
  [["GL" <> match]] ->
    {"gl" <> match, "GL" <> match}
  [[match]] ->
    {match, match}
end

to_fun = fn {name, macro} ->
  ~s"""
  #{name}() ->
    ?#{macro}.

  """
end

Enum.into(header, file_out)

file_in
|> Enum.map(&Regex.scan(name_regex, &1, capture: :first))
|> Enum.map(parse_match)
|> Enum.map(to_fun)
|> Enum.into(file_out)
