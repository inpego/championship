team_one = Team.create(name: 'Слуцк')
team_two = Team.create(name: 'Витебск')

players_one = ['Илья Брановец', 'Борис Панкратов', 'Виталий Трубило', 'Коанда Сулейман', 'Денис Образов'].map do |name|
  team_one.players.create(name: name)
end

players_two = ['Гущенко Дмитрий', 'Артём Сороко', 'Скитов Артём', 'Клопоцкий Евгений', 'Чалов Даниил'].map do |name|
  team_two.players.create(name: name)
end

results = { '01-15' => '2:1', '01-21' => '0:0', '01-28' => '1:1', '02-12' => '1:3', '02-16' => '1:0', '02-22' => '1:2' }
matches = results.map do |date, result|
  Match.create(team_one: team_one, team_two: team_two, created_at: '2020-' + date, result: result)
end

significatives = ['пробежал 10+ км', 'сделал 70+% точных передач'].map { |name| Significative.create(name: name) }

MatchSignificative.create(match: matches[0], player: players_one[2], significative: significatives[0])
MatchSignificative.create(match: matches[0], player: players_two[3], significative: significatives[0])
MatchSignificative.create(match: matches[1], player: players_one[1], significative: significatives[0])
MatchSignificative.create(match: matches[5], player: players_one[1], significative: significatives[0])
MatchSignificative.create(match: matches[3], player: players_one[1], significative: significatives[0])
MatchSignificative.create(match: matches[1], player: players_one[0], significative: significatives[0])
MatchSignificative.create(match: matches[2], player: players_two[2], significative: significatives[1])
MatchSignificative.create(match: matches[3], player: players_two[2], significative: significatives[0])
MatchSignificative.create(match: matches[4], player: players_two[2], significative: significatives[1])
MatchSignificative.create(match: matches[2], player: players_one[1], significative: significatives[0])
MatchSignificative.create(match: matches[3], player: players_one[2], significative: significatives[1])
MatchSignificative.create(match: matches[4], player: players_two[1], significative: significatives[1])
MatchSignificative.create(match: matches[4], player: players_one[3], significative: significatives[1])
MatchSignificative.create(match: matches[4], player: players_one[3], significative: significatives[0])
MatchSignificative.create(match: matches[4], player: players_two[0], significative: significatives[0])
MatchSignificative.create(match: matches[4], player: players_one[4], significative: significatives[0])
MatchSignificative.create(match: matches[5], player: players_two[4], significative: significatives[1])
MatchSignificative.create(match: matches[4], player: players_two[4], significative: significatives[1])
MatchSignificative.create(match: matches[3], player: players_two[4], significative: significatives[1])
MatchSignificative.create(match: matches[5], player: players_one[0], significative: significatives[1])
MatchSignificative.create(match: matches[3], player: players_one[0], significative: significatives[1])
MatchSignificative.create(match: matches[2], player: players_one[0], significative: significatives[1])

MatchSignificative.create(match: matches[0], player: players_two[2], significative: significatives[0])
MatchSignificative.create(match: matches[0], player: players_one[3], significative: significatives[1])
MatchSignificative.create(match: matches[0], player: players_one[3], significative: significatives[0])
MatchSignificative.create(match: matches[1], player: players_two[1], significative: significatives[0])
MatchSignificative.create(match: matches[1], player: players_two[0], significative: significatives[0])
MatchSignificative.create(match: matches[2], player: players_one[2], significative: significatives[0])
MatchSignificative.create(match: matches[2], player: players_two[1], significative: significatives[1])
MatchSignificative.create(match: matches[3], player: players_two[2], significative: significatives[1])
MatchSignificative.create(match: matches[4], player: players_one[1], significative: significatives[1])
MatchSignificative.create(match: matches[4], player: players_two[3], significative: significatives[1])
MatchSignificative.create(match: matches[4], player: players_one[0], significative: significatives[1])
MatchSignificative.create(match: matches[4], player: players_two[4], significative: significatives[0])
MatchSignificative.create(match: matches[5], player: players_one[4], significative: significatives[0])
MatchSignificative.create(match: matches[5], player: players_two[0], significative: significatives[0])
