ALTER TABLE persons_bio
  ADD CONSTRAINT persons_bio_person_id_fk 
    FOREIGN KEY (person_id) REFERENCES persons(id)
      ON DELETE CASCADE;
      
ALTER TABLE roles
  ADD CONSTRAINT roles_video_id_fk 
    FOREIGN KEY (video_id) REFERENCES video(id),
  ADD CONSTRAINT roles_person_id_fk 
    FOREIGN KEY (person_id) REFERENCES persons(id),
  ADD CONSTRAINT roles_role_type_id_fk 
    FOREIGN KEY (role_type_id) REFERENCES roles_type(id);
    
ALTER TABLE video_info
  ADD CONSTRAINT video_info_video_id_fk 
    FOREIGN KEY (video_id) REFERENCES video(id),
  ADD CONSTRAINT video_info_genre_id_fk 
    FOREIGN KEY (genre_id) REFERENCES genres(id),
  ADD CONSTRAINT video_info_type_id_fk 
    FOREIGN KEY (video_type_id) REFERENCES video_type(id);

ALTER TABLE reviews
  ADD CONSTRAINT reviews_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT reviews_video_id_fk 
    FOREIGN KEY (video_id) REFERENCES video(id);
    
ALTER TABLE video_score
  ADD CONSTRAINT video_score_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT video_score_video_id_fk 
    FOREIGN KEY (video_id) REFERENCES video(id);

