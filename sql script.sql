DROP TABLE IF EXISTS Places CASCADE;
DROP TABLE IF EXISTS Characters CASCADE;
DROP TABLE IF EXISTS New_Characters CASCADE;
DROP TABLE IF EXISTS Life_Cycles CASCADE;
DROP TABLE IF EXISTS Life_Cycle_Memories CASCADE;
DROP TABLE IF EXISTS Memories CASCADE;
DROP TABLE IF EXISTS Character_Helpers CASCADE;

CREATE TABLE Places(id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, description TEXT);

CREATE TABLE Characters(id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, current_state VARCHAR(255), time INT, place INT, FOREIGN KEY (place) REFERENCES Places(id));

CREATE TABLE New_Charecters(new_character_id INT NOT NULL, old_character_id INT NOT NULL, FOREIGN KEY (new_character_id) REFERENCES Characters(id), FOREIGN KEY (old_character_id) REFERENCES Characters(id));

CREATE TABLE Character_Helpers(role VARCHAR(255), character_id INT NOT NULL, helper_id INT NOT NULL, PRIMARY KEY (character_id, helper_id), FOREIGN KEY (character_id) REFERENCES Characters(id), FOREIGN KEY (helper_id) REFERENCES Characters(id));

CREATE TABLE Memories(id SERIAL PRIMARY KEY, character_id INT, content TEXT, creation_time DATE, status VARCHAR(255), FOREIGN KEY (character_id) REFERENCES Characters(id));

CREATE TABLE Life_Cycles(id SERIAL PRIMARY KEY, character_id INT NOT NULL, start_phase VARCHAR(255), end_phase VARCHAR(255), FOREIGN KEY (character_id) REFERENCES Characters(id));

CREATE TABLE Life_Cycle_Memories (life_cycle_id INT NOT NULL, memory_id INT NOT NULL, PRIMARY KEY (life_cycle_id, memory_id), FOREIGN KEY (life_cycle_id) REFERENCES Life_Cycles(id), FOREIGN KEY (memory_id) REFERENCES memories(id));

INSERT INTO Places(name, description) VALUES ('Диаспар', 'Город настоящего');
INSERT INTO Places(name, description) VALUES ('Диаспар', 'Город будущего');
INSERT INTO Characters(name, current_state, time, place) VALUES ('Олвин', 'спит', 2024, 1);
INSERT INTO Characters(name, current_state, time, place) VALUES ('Олвин', 'проснулся', 102024, 2);
INSERT INTO Characters(name, current_state, time, place) VALUES ('Эристон', 'жив', 2024, 1);
INSERT INTO Characters(name, current_state, time, place) VALUES ('Итания', 'жива', 2024, 1);

INSERT INTO New_Characters(new_character_id, old_character_id) VALUES (1, 2);

INSERT INTO Character_Helpers(role, character_id, helper_id) VALUES ('опекун', 1, 3);
INSERT INTO Character_Helpers(role, place_id) VALUES ('наставник', 1, 4);

INSERT INTO Memories(character_id, content, creation_time, status) VALUES (1, 'воспоминание о Диаспоре и себе в прошлом', '2025-02-25', 'возвращается');
INSERT INTO Memories(character_id, content, creation_time, status) VALUES (1, 'воспоминания из младенчества', '102025-02-25', 'создаются');

INSERT INTO Life_Cycles(character_id, start_phase, end_phase) VALUES (1, 'пробуждение', 'конец младенчества');
INSERT INTO Life_Cycles(character_id, start_phase, end_phase) VALUES (1, 'начало юность', 'конец юности');

INSERT INTO Life_Cycle_Memories (life_cycle_id, memory_id) VALUES (1, 1);
INSERT INTO Life_Cycle_Memories (life_cycle_id, memory_id) VALUES (2, 2);
