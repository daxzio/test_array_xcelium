module dut (
    clk,
    rgb,
    pixel0,
    pixel1,
    pixel2
);
    input wire clk;
    input wire [7:0] rgb [2:0];
    output wire [7:0] pixel0;
    output wire [7:0] pixel1;
    output wire [7:0] pixel2;

    array1 i_array1 (.*);


`ifdef COCOTB_SIM
    initial begin
        $dumpfile("dut.vcd");
        $dumpvars(0, dut);
        #1;
    end
`endif


endmodule

