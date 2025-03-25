-- AAV 6 : produire un TESTBENCH pour un compteur 4 bits avec reset , enable et  load. 
-- criteres : 1. autonomie. 2. démonstration de toutes les fonctionnalités. 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_4bit is
    Port (
        clk   : in  STD_LOGIC;  -- Horloge
        reset : in  STD_LOGIC;  -- Réinitialisation asynchrone
        enable: in  STD_LOGIC;  -- Activation du comptage
        load  : in  STD_LOGIC;  -- Chargement d'une valeur
        data_in : in  STD_LOGIC_VECTOR(3 downto 0); -- Valeur à charger
        count : out STD_LOGIC_VECTOR(3 downto 0)  -- Valeur du compteur
    );
end counter_4bit;

architecture Behavioral of counter_4bit is
    signal counter : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process
    begin
    	wait until rising_edge(clk);
        if reset = '1' then
            counter <= (others => '0');  
         elsif load = '1' then
                counter <= data_in;  
         elsif enable = '1' then
                counter <= counter + 1; 
          end if;
    end process;
    count <= counter;
end Behavioral;
