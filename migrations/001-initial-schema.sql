-- Up
CREATE TABLE restaurant (
  id INTEGER PRIMARY KEY,
  name TEXT
);

INSERT INTO restaurant
VALUES (1, 'The Low-Cal Calzone Zone'), (2, 'Food n Stuff');

-- Down
DROP TABLE restaurant;
