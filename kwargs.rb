def monie(name, opts)
  puts name, opts[:detail]
end

monie("Eze", { detail: "old" })