module usr_tb(

    );
    reg        clk;
reg        rst;
reg        sid;
reg [3:0]  pid;
reg        shift;
reg        load;
reg [1:0]  mode;

wire [3:0] pout;
wire       sout;

universal_shift_register dut (
    .clk   (clk),
    .rst   (rst),
    .sid   (sid),
    .pid   (pid),
    .shift (shift),
    .load  (load),
    .mode  (mode),
    .pout  (pout),
    .sout  (sout)
);



initial begin
    clk = 0;
    forever #5 clk = ~clk;
end


initial begin

   clk = 0;
    forever #5 clk = ~clk;
end



initial begin


    rst   = 1;
    sid   = 0;
    pid   = 0;
    shift = 0;
    load  = 0;
    mode  = 2'b00;

    #12;
    rst = 0;

  

    mode  = 2'b00;
    shift = 1;

    sid = 1; #10;
    sid = 0; #10;
    sid = 1; #10;
    sid = 1; #10;

    shift = 0;
    #20;


    

    mode  = 2'b01;
    shift = 1;

    sid = 1; #10;
    sid = 0; #10;
    sid = 0; #10;
    sid = 1; #10;

    shift = 0;
    #20;


    mode = 2'b10;

  
    pid  = 4'b1101;
    load = 1;
    #10;

    load  = 0;
    shift = 1;

    repeat(4) #10;

    shift = 0;
    #20;

  
   

    mode = 2'b11;

    pid  = 4'b1010;
    load = 1;
    #10;

    load = 0;
    #20;

    pid  = 4'b0111;
    load = 1;
    #10;

    load = 0;
    #20;

   
    #20;
    $finish; end
endmodule

