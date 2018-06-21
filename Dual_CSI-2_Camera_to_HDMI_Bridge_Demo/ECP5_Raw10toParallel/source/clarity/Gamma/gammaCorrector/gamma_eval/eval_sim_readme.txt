=========== Gamma Corrector Testbench ===========


=== Normal sequence of operation: 

   1)  Asynchronous reset is asserted for few cycles 
   2)  The input "inpvalid" is asserted, indicating valid input color plane data is 
       present on "din0", "din1" and "din2". 
   3)  After latency of few cycles output "outvalid" goes high, indicating valid output
       color plane data is present on "dout0", "dout1" and "dout2".
