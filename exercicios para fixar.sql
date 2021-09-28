select * from item_nf
where id_nf = 4;

--a
select id_nf, id_item, cod_prod, valor_unit, desconto
from item_nf
where desconto is null;

update item_nf
set desconto = null
where desconto = 0;

---b 

select id_nf, id_item, cod_prod, valor_unit, (valor_unit*(desconto/100)) as valor_vendido
from item_nf
where desconto is not null;

---c 
update item_nf
set desconto = 0
where desconto is null;

--d 
select id_nf, id_item, cod_prod, valor_unit,desconto, quantidade, (quantidade*valor_unit)as valor_total,
(valor_unit*(desconto/100)) as valor_vendido
from item_nf
where desconto <> 0;

---e 
select id_nf, 
sum(quantidade*valor_unit) as valor_total
from item_nf
group by id_nf
order by valor_total desc;

--f
select id_nf,
sum(quantidade*valor_unit) as valor_total,
sum(valor_unit - (valor_unit*(quantidade/100))) as valor_vendido
from item_nf
group by id_nf
order by valor_total desc;

---g

select cod_prod, sum(quantidade)as quantidade
from item_nf
group by cod_prod
order by quantidade desc;

---h 
select id_nf, cod_prod, sum(quantidade) as quantidade
from item_nf
where quantidade > 10
group by id_nf, cod_prod;

--i 

select id_nf,valor_total
from 
    (select id_nf, sum(quantidade * valor_unit) as valor_total
from item_nf
group by id_nf) tabela
where valor_total > 500;


---j 

select cod_prod,round(AVG(desconto),2) as media
from item_nf
group by cod_prod;

--k
select cod_prod, min(desconto)as menor, max(desconto)as maior, round(AVG(desconto),2) as media
from item_nf
group by cod_prod;

--l 
select id_nf, qtd_itens
from
    (select id_nf,count(*) as qtd_itens
from item_nf
group by id_nf) tabela
where qtd_itens >= 3;
