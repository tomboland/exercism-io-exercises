use std::collections::HashMap;
static HEADER: &'static str = "Team                           | MP |  W |  D |  L |  P";

#[derive(PartialEq, Debug)]
enum MatchResult {
    Win,
    Draw,
    Lost,
}

#[derive(Default, Debug)]
struct TeamRecord {
    played: i32,
    won: i32,
    drawn: i32,
    lost: i32,
    points: i32,
}

fn update_team_record(team_record: &TeamRecord, match_result: &MatchResult) -> TeamRecord {
    match match_result {
        MatchResult::Win => TeamRecord {
            won: team_record.won + 1,
            played: team_record.played + 1,
            points: team_record.points + 3,
            ..*team_record
        },
        MatchResult::Lost => TeamRecord {
            lost: team_record.lost + 1,
            played: team_record.played + 1,
            ..*team_record
        },
        MatchResult::Draw => TeamRecord {
            drawn: team_record.drawn + 1,
            played: team_record.played + 1,
            points: team_record.points + 1,
            ..*team_record
        },
    }
}

fn team_records_from_match_results(match_results: &str) -> HashMap<String, TeamRecord> {
    let mut team_records = HashMap::<String, TeamRecord>::new();
    match_results.split('\n').for_each(|line| {
        if line.is_empty() {
            return;
        }
        let v: Vec<&str> = line.split(';').collect();
        let (home, away, result) = (v[0], v[1], v[2]);
        let (home_result, away_result) = match result {
            "win" => (MatchResult::Win, MatchResult::Lost),
            "loss" => (MatchResult::Lost, MatchResult::Win),
            "draw" => (MatchResult::Draw, MatchResult::Draw),
            _ => panic!("Inconcievable result! Inconcievable!"),
        };
        team_records
            .entry(home.to_owned())
            .and_modify(|e| *e = update_team_record(e, &home_result))
            .or_insert_with(|| update_team_record(&TeamRecord::default(), &home_result));
        team_records
            .entry(away.to_owned())
            .and_modify(|e| *e = update_team_record(e, &away_result))
            .or_insert_with(|| update_team_record(&TeamRecord::default(), &away_result));
    });
    team_records
}

fn format_tally(team_record: HashMap<String, TeamRecord>) -> String {
    let mut teams_records: Vec<(&String, &TeamRecord)> = team_record.iter().collect();
    teams_records.sort_by(|a, b| {
        if b.1.points != a.1.points {
            b.1.points.cmp(&a.1.points)
        } else {
            a.0.cmp(&b.0)
        }
    });
    teams_records
        .into_iter()
        .fold(&mut vec![HEADER.to_string()], |acc, (team_name, record)| {
            acc.push(format!(
                "{:<31}| {:>2} | {:>2} | {:>2} | {:>2} | {:>2}",
                team_name, record.played, record.won, record.drawn, record.lost, record.points
            ));
            acc
        })
        .join("\n")
}

pub fn tally(match_results: &str) -> String {
    let team_records = team_records_from_match_results(match_results);
    format_tally(team_records)
}
