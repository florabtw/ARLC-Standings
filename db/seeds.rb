# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

leagueSolo     = League.create(name: 'Solo')
leaguesDoubles = League.create(name: 'Doubles')
leagueStandard = League.create(name: 'Standard')

regionNA = Region.create(name: 'North America')
regionEU = Region.create(name: 'Europe')
regionAU = Region.create(name: 'Australia')

Division.create(name: 'NA Standard: Division 1', region: regionNA, league: leagueStandard)
Division.create(name: 'NA Standard: Division 2', region: regionNA, league: leagueStandard)
Division.create(name: 'EU Standard: Division 1', region: regionEU, league: leagueStandard)
Division.create(name: 'EU Standard: Division 2', region: regionEU, league: leagueStandard)

Division.create(name: 'NA Solo: Division 1', region: regionNA, league: leagueSolo)
Division.create(name: 'NA Solo: Division 2', region: regionNA, league: leagueSolo)
Division.create(name: 'EU Solo: Division 1', region: regionEU, league: leagueSolo)
Division.create(name: 'EU Solo: Division 2', region: regionEU, league: leagueSolo)

MatchStatus.create(name: 'Played')
MatchStatus.create(name: 'Playing')
MatchStatus.create(name: 'Planned')
