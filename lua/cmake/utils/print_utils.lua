local M = {}

M.table_to_string = function(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. M.table_to_string(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

M.print_table = function(o) print(M.table_to_string(o)) end

return M
