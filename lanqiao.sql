select * from category;
begin 
    for i in 1.. 20
    loop
        insert into category values(seq_category.nextval,'��Ʒ����'||i,'��Ʒ����1'||i);
    end loop;
end;

select * from (select c.*,rownum r from category c where rownum<=20)
where r>15;
