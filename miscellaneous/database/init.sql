-- Initialize NFLStats Database

DROP TABLE IF EXISTS
    GameCenter, GameDrivePlayer, GameDrivePlay, GameDrive, Game, Player, Team,
    game_center_sequence, game_drive_player_sequence, game_drive_play_sequence, game_drive_sequence, game_sequence, player_sequence, team_sequence;

CREATE OR REPLACE FUNCTION trigger_set_timestamp()
              RETURNS TRIGGER AS $$
BEGIN
    NEW.LastUpdateDate = NOW();
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create the GameCenter table
CREATE TABLE GameCenter
(
    Id             SERIAL PRIMARY KEY,
    GameDate       VARCHAR(20) NOT NULL,
    GameNumber     INT         NOT NULL,
    Processed      BOOLEAN DEFAULT FALSE,
    Json           TEXT        NOT NULL,
    LastUpdateDate TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT UK_GameCenter_Date_Number UNIQUE (GameDate, GameNumber)
);

CREATE TRIGGER set_gamecenter_timestamp
    BEFORE UPDATE ON GameCenter
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_set_timestamp();

-- Create the Team table
CREATE TABLE Team
(
    Id             SERIAL PRIMARY KEY,
    CODE           VARCHAR(5)  NOT NULL DEFAULT '',
    FullName       VARCHAR(50) NOT NULL DEFAULT '',
    ShortName      VARCHAR(20) NOT NULL DEFAULT '',
    Conference     VARCHAR(3)  NOT NULL DEFAULT '',
    Division       VARCHAR(5)  NOT NULL DEFAULT '',
    LastUpdateDate TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT UK_Code UNIQUE (CODE)
);

CREATE TRIGGER set_team_timestamp
    BEFORE UPDATE ON GameCenter
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_set_timestamp();

-- Create the Player table
CREATE TABLE Player
(
    Id             SERIAL PRIMARY KEY,
    Active         BIT(1) NOT NULL,
    Jersey         INT    NOT NULL,
    LastName       VARCHAR(50) DEFAULT NULL,
    FirstName      VARCHAR(50) DEFAULT NULL,
    DisplayName    VARCHAR(75) DEFAULT NULL,
    TeamCode       VARCHAR(5)  DEFAULT NULL,
    Position       VARCHAR(5)  DEFAULT NULL,
    Height         VARCHAR(10) DEFAULT NULL,
    Weight         VARCHAR(10) DEFAULT NULL,
    DateOfBirth    VARCHAR(20) DEFAULT NULL,
    College        VARCHAR(50) DEFAULT NULL,
    LastUpdateDate TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT UK_Name_Team_Position UNIQUE (DisplayName, TeamCode, Position)
);

CREATE TRIGGER set_player_timestamp
    BEFORE UPDATE ON GameCenter
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_set_timestamp();

-- Create the Game table
CREATE TABLE Game
(
    Id             SERIAL PRIMARY KEY,
    GameDate       VARCHAR(20) NOT NULL,
    GameNumber     INT         NOT NULL,
    HomeTeamCode   VARCHAR(5)  NOT NULL,
    HomeScore      INT         NOT NULL,
    HomeWinLoss    BIT(1)      NOT NULL,
    AwayTeamCode   VARCHAR(5)  NOT NULL,
    AwayScore      INT         NOT NULL,
    AwayWinLoss    BIT(1)      NOT NULL,
    LastUpdateDate TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT UK_Game_Date_Number UNIQUE (GameDate, GameNumber)
);

CREATE TRIGGER set_game_timestamp
    BEFORE UPDATE ON GameCenter
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_set_timestamp();

CREATE TABLE GameDrive
(
    Id             SERIAL PRIMARY KEY,
    GameId         BIGINT      NOT NULL REFERENCES Game (Id),
    DriveNumber    INT         NOT NULL,
    Result         VARCHAR(20)                   DEFAULT '',
    TeamCode       VARCHAR(5)  NOT NULL,
    PossessionTime VARCHAR(10) NOT NULL          DEFAULT '',
    QUARTER        INT                           DEFAULT 0,
    PenaltyYards   INT                           DEFAULT 0,
    YardsGained    INT                           DEFAULT 0,
    RedZone        BOOLEAN                       DEFAULT FALSE,
    NumberOfPlays  INT                           DEFAULT 0,
    FirstDowns     INT                           DEFAULT 0,
    StartYardLine  VARCHAR(20) NOT NULL          DEFAULT '',
    StartTime      VARCHAR(10) NOT NULL          DEFAULT '',
    StartQuarter   INT                           DEFAULT 0,
    StartTeamCode  VARCHAR(5)  NOT NULL NOT NULL DEFAULT '',
    EndYardLine    VARCHAR(20) NOT NULL          DEFAULT '',
    EndTime        VARCHAR(10) NOT NULL          DEFAULT '',
    EndQuarter     INT                           DEFAULT 0,
    EndTeamCode    VARCHAR(5)  NOT NULL          DEFAULT '',
    LastUpdateDate TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT UK_Id_Number UNIQUE (GameId, DriveNumber)
);

CREATE TRIGGER set_gamedrive_timestamp
    BEFORE UPDATE ON GameCenter
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_set_timestamp();

CREATE TABLE GameDrivePlay
(
    Id             SERIAL PRIMARY KEY,
    GameDriveId    BIGINT     NOT NULL REFERENCES GameDrive (Id),
    PlayKey        INT        NOT NULL,
    SP             INT         DEFAULT 0,
    QUARTER        INT        NOT NULL,
    Down           INT        NOT NULL,
    TIME           VARCHAR(20) DEFAULT '',
    YardLine       VARCHAR(10) DEFAULT '',
    YardsToGo      INT         DEFAULT 0,
    YardsNet       INT         DEFAULT 0,
    PosessionTeam  VARCHAR(5) NOT NULL,
    Description    TEXT        DEFAULT '',
    Note           VARCHAR(50) DEFAULT '',
    LastUpdateDate TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT UK_Id_PlayKey UNIQUE (GameDriveId, PlayKey)
);

CREATE TRIGGER set_gamedriveplay_timestamp
    BEFORE UPDATE ON GameCenter
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_set_timestamp();

CREATE TABLE GameDrivePlayer
(
    Id              SERIAL PRIMARY KEY,
    GameDrivePlayId BIGINT      NOT NULL REFERENCES GameDrivePlay (Id),
    PlayKey         VARCHAR(20) NOT NULL,
    Sequence        INT         NOT NULL,
    TeamCode        VARCHAR(5)  NOT NULL,
    PlayerName      VARCHAR(20),
    StatisticsId    INT,
    Yards           INT,
    LastUpdateDate  TIMESTAMP NOT NULL DEFAULT now(),
    CONSTRAINT UK_PlayId_PlayKey_Sequence UNIQUE (GameDrivePlayId, PlayKey, Sequence)
);

CREATE TRIGGER set_gamedriveplayer_timestamp
    BEFORE UPDATE ON GameCenter
    FOR EACH ROW
    EXECUTE PROCEDURE trigger_set_timestamp();

COMMIT;

INSERT INTO Team (Id, Code, FullName, ShortName, Conference, Division)
VALUES (1, 'ARI', 'Arizona Cardinals', 'Arizona', 'NFC', 'West'),
       (2, 'ATL', 'Atlanta Falcons', 'Atlanta', 'NFC', 'South'),
       (3, 'BAL', 'Baltimore Ravens', 'Baltimore', 'AFC', 'North'),
       (4, 'BUF', 'Buffalo Bills', 'Buffalo', 'AFC', 'East'),
       (5, 'CAR', 'Carolina Panthers', 'Carolina', 'NFC', 'South'),
       (6, 'CHI', 'Chicago Bears', 'Chicago', 'NFC', 'North'),
       (7, 'CIN', 'Cincinnati Bengals', 'Cincinnati', 'AFC', 'North'),
       (8, 'CLE', 'Cleveland Browns', 'Cleveland', 'AFC', 'North'),
       (9, 'DAL', 'Dallas Cowboys', 'Dallas', 'NFC', 'East'),
       (10, 'DEN', 'Denver Broncos', 'Denver', 'AFC', 'West'),
       (11, 'DET', 'Detroit Lions', 'Detroit', 'NFC', 'North'),
       (12, 'GB', 'Green Bay Packers', 'Green Bay', 'NFC', 'North'),
       (13, 'HOU', 'Houston Texans', 'Houston', 'AFC', 'South'),
       (14, 'IND', 'Indianapolis Colts', 'Indianapolis', 'AFC', 'South'),
       (15, 'JAX', 'Jacksonville Jaguars', 'Jacksonville', 'AFC', 'South'),
       (16, 'KC', 'Kansas City Chiefs', 'Kansas City', 'AFC', 'West'),
       (17, 'MIA', 'Miami Dolphins', 'Miami', 'AFC', 'East'),
       (18, 'MIN', 'Minnesota Vikings', 'Minnesota', 'NFC', 'North'),
       (19, 'NYG', 'N.Y. Giants', 'N.Y. Giants', 'NFC', 'East'),
       (20, 'NYJ', 'N.Y. Jets', 'N.Y. Jets', 'AFC', 'East'),
       (21, 'NE', 'New England Patriots', 'New England', 'AFC', 'East'),
       (22, 'NO', 'New Orleans Saints', 'New Orleans', 'NFC', 'South'),
       (23, 'OAK', 'Oakland Raiders', 'Oakland', 'AFC', 'West'),
       (24, 'PHI', 'Philadelphia Eagles', 'Philadelphia', 'NFC', 'East'),
       (25, 'PIT', 'Pittsburgh Steelers', 'Pittsburgh', 'AFC', 'North'),
       (26, 'LAC', 'Los Angeles Chargers', 'L.A. Chargers', 'AFC', 'West'),
       (27, 'SF', 'San Francisco 49ers', 'San Francisco', 'NFC', 'West'),
       (28, 'SEA', 'Seattle Seahawks', 'Seattle', 'NFC', 'West'),
       (29, 'LA', 'Los Angeles Rams', 'L.A. Rams', 'NFC', 'West'),
       (30, 'TB', 'Tampa Bay Buccaneers', 'Tampa Bay', 'NFC', 'South'),
       (31, 'TEN', 'Tennessee Titans', 'Tennessee', 'AFC', 'South'),
       (32, 'WAS', 'Washington Redskins', 'Washington', 'NFC', 'East');

COMMIT;
