library std;
use std.textio.all;

entity filehandle is
end filehandle;


architecture Behavioral of filehandle is
--period of clock,bit for indicating end of file.
signal clock,endoffile : bit := '0';
--data read from the file.
signal    dataread : real;
--data to be saved into the output file.
signal    datatosave : real;
--line number of the file read or written.
signal    linenumber : integer:=1; 

begin


clock <= not (clock) after 1 ns;    --clock with time period 2 ns


--read process
reading :
process
    file   infile    : text is in  "1.txt";   --declare input file
    variable  inline    : line; --line number declaration
    variable  dataread1    : real;
begin
wait until clock = '1' and clock'event;
if (not endfile(infile)) then   --checking the "END OF FILE" is not reached.
readline(infile, inline);       --reading a line from the file.
  --reading the data from the line and putting it in a real type variable.
read(inline, dataread1);
dataread <=dataread1;   --put the value available in variable in a signal.
else
endoffile <='1';         --set signal to tell end of file read file is reached.
end if;

end process;