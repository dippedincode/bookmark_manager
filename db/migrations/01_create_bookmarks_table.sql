CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');
INSERT INTO bookmarks (url) VALUES ('http://www.askjeeves.com');
INSERT INTO bookmarks (url) VALUES ('http://twitter.com');
SELECT * FROM bookmarks;
DELETE FROM bookmarks WHERE id = 3;
SELECT * FROM bookmarks;
UPDATE bookmarks SET url = 'http://www.destroyallsoftware.com' WHERE id = 2;
# you can also do UPDATE bookmarks SET url = 'http://www.destroyallsoftware.com' 
#                   WHERE url = 'http://www.askjeeves.com'; 
INSERT INTO bookmarks (url) VALUES ('http://www.youtube.com');