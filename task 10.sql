-- created a trigger function which can automatically give a incremented price by +100 into a new column new_price
-- given the condition that if the new inserted price is > 20000 then the new_price will be "price + 100"


select * from vehical

create or replace function updated_price()
returns trigger as $$
begin
	if new.price > 20000 then
	new.new_price := new.price +100;
	end if;
return new;
end
$$ language plpgsql;


create trigger trigger_updated_price
before insert on vehical
for each row
execute function updated_price()


insert into vehical (id,name,price,is_deleted,model) values(22,'car22',200000,'true','model22')
insert into vehical (id,name,price,is_deleted,model) values(23,'car23',234210,'true','model23')