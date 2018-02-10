SELECT m.media_isbn, m.media_title, m.media_publish_date, m.media_description, m.media_img,
a.author_first_name, a.author_last_name,
p.publisher_name,
p.publisher_address,
p.publisher_size,
mt.media_type

FROM media m
INNER JOIN author a ON m.fk_author_id = a.author_id
INNER JOIN publisher p ON m.fk_publisher_id = p.publisher_id
INNER JOIN media_type mt ON m.fk_media_type_id = mt.media_type_id;
