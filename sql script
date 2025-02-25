DROP TABLE IF EXISTS Places CASCADE;
DROP TABLE IF EXISTS Characters CASCADE;
DROP TABLE IF EXISTS Bodies CASCADE;
DROP TABLE IF EXISTS Helpers CASCADE;
DROP TABLE IF EXISTS Life_Cycles CASCADE;
DROP TABLE IF EXISTS Life_Cycle_Memories CASCADE;
DROP TABLE IF EXISTS Memories CASCADE;
DROP TABLE IF EXISTS Character_Helpers CASCADE;

CREATE TABLE Places(id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, description TEXT);

CREATE TABLE Characters(id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, current_state VARCHAR(255), awakening_time INT, awaking_place INT, FOREIGN KEY (awaking_place) REFERENCES Places(id));

CREATE TABLE Bodies(id SERIAL PRIMARY KEY, character_id INT, state VARCHAR(255), existence_phase VARCHAR(255), FOREIGN KEY (character_id) REFERENCES Characters(id));

CREATE TABLE Helpers(id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, role VARCHAR(255), place_id INT, FOREIGN KEY (place_id) REFERENCES Places(id));

CREATE TABLE Character_Helpers (character_id INT NOT NULL, helper_id INT NOT NULL, PRIMARY KEY (character_id, helper_id), FOREIGN KEY (character_id) REFERENCES Characters(id), FOREIGN KEY (helper_id) REFERENCES Helpers(id));

CREATE TABLE Memories(id SERIAL PRIMARY KEY, character_id INT, content TEXT, creation_time DATE, status VARCHAR(255), FOREIGN KEY (character_id) REFERENCES Characters(id));

CREATE TABLE Life_Cycles(id SERIAL PRIMARY KEY, character_id INT NOT NULL, start_phase VARCHAR(255), end_phase VARCHAR(255), FOREIGN KEY (character_id) REFERENCES Characters(id));

CREATE TABLE Life_Cycle_Memories (life_cycle_id INT NOT NULL, memory_id INT NOT NULL, PRIMARY KEY (life_cycle_id, memory_id), FOREIGN KEY (life_cycle_id) REFERENCES Life_Cycles(id), FOREIGN KEY (memory_id) REFERENCES memories(id));

INSERT INTO Places(name, description) VALUES ('Диаспар', 'Город будущего, место пробуждения');
INSERT INTO Characters(name, current_state, awakening_time, awaking_place) VALUES ('Олвин', 'спит', 100000, 1);
INSERT INTO Bodies(character_id, state, existence_phase) VALUES (1, 'новое', 'младенчество');

INSERT INTO Helpers(name, role, place_id) VALUES ('Эристон', 'опекун', 1);
INSERT INTO Helpers(name, role, place_id) VALUES ('Итания', 'наставник', 1);

INSERT INTO Character_Helpers(character_id, helper_id) VALUES (1, 1);
INSERT INTO Character_Helpers(character_id, helper_id) VALUES (1, 2);

INSERT INTO Memories(character_id, content, creation_time, status) VALUES (1, 'воспоминание о Диаспоре и себе в прошлом', '2025-02-25', 'возвращается');
INSERT INTO Memories(character_id, content, creation_time, status) VALUES (1, 'воспоминания из младенчества', '102025-02-25', 'создаются');

INSERT INTO Life_Cycles(character_id, start_phase, end_phase) VALUES (1, 'пробуждение', 'конец младенчества');
INSERT INTO Life_Cycles(character_id, start_phase, end_phase) VALUES (1, 'начало юность', 'конец юности');

INSERT INTO Life_Cycle_Memories (life_cycle_id, memory_id) VALUES (1, 1);
INSERT INTO Life_Cycle_Memories (life_cycle_id, memory_id) VALUES (2, 2);
\q
