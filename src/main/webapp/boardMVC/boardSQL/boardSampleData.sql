delete from boardV01;

drop sequence board_num;

create sequence board_num
	start with 1
	minvalue 1
	increment by 1;
	
declare
	type namesT is table of shop_user.user_name%type
	index by binary_integer;
	
	idx1 binary_integer := -1;
	idx2 binary_integer := -1;
	
	nameList namesT;
begin
	for i in 0 .. 254 loop
		idx1 := idx1 + 1;
		for users in (select user_name from shop_user) loop
			idx2 := idx2 + 1;
			nameList(idx2) := users.user_name;
		end loop;
		insert into boardV01
		values(
			board_num.nextval,
			nameList(MOD(idx1, idx2)),
			nameList(MOD(idx1, idx2)) || '@test.com',
			board_num.currval || '번째 글',
			'1234',
			sysdate - idx1,
			nameList(MOD(idx1, idx2)) || '님의 게시글입니다',
			0,
			'127.0.0.1'
		);
		idx2 := -1;
	end loop;
end;
/