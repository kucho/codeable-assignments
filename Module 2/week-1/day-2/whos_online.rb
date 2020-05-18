def who_is_online(friends)
  online = friends.select { |e| e["status"] == "online" && e["last_activity"] <= 10 }.map { |i| i["username"] }
  offline = friends.select { |e| e["status"] == "offline" }.map { |i| i["username"] }
  away = friends.select { |e| e["status"] == "online" && e["last_activity"] > 10 }.map { |i| i["username"] }

  result = {}
  result["online"] = online if online.any?
  result["offline"] = offline if offline.any?
  result["away"] = away if away.any?
  result
end


friends = [{"username" => "David", "status" => "online", "last_activity" => 10},
           {"username" => "Lucy", "status" => "offline", "last_activity" => 22},
           {"username" => "Bob", "status" => "online", "last_activity" => 104}]

puts who_is_online(friends)