module array1 (
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
    
    reg [7:0] f_pixel0;
    reg [7:0] f_pixel1;
    reg [7:0] f_pixel2;

    always @ (posedge clk) begin
        f_pixel0 <= 255 - rgb[0];
        f_pixel1 <= 255 - rgb[1];
        f_pixel2 <= 255 - rgb[2];
    end
    
    assign pixel0 = f_pixel0;
    assign pixel1 = f_pixel1;
    assign pixel2 = f_pixel2;
    
endmodule
