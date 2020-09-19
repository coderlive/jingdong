select * from category;
begin 
    for i in 1.. 20
    loop
        insert into category values(seq_category.nextval,'商品种类'||i,'商品描述1'||i);
    end loop;
end;

select * from (select c.*,rownum r from category c where rownum<=20)
where r>15;
