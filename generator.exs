source = "./defines.txt"
dest = "./src/wx_const.erl"
header = ["-module(wx_const).\n", "-compile(export_all).\n", "\n", "-include_lib(\"wx/include/wx.hrl\").\n", "\n"]
name_regex = ~r/(?<=\-define\()(?:.*?)(?=\,)/

File.rm(dest)
File.touch(dest)

file_in = File.stream!(source, [encoding: :utf8])
file_out = File.stream!(dest, [{:encoding, :utf8}, :delayed_write, :append])

parse_match = fn   
  [["WXK" <> match]] ->
    {"wxk" <> match, "WXK" <> match}
  [["WX" <> match]] ->
    {"wx" <> match, "WX" <> match}
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