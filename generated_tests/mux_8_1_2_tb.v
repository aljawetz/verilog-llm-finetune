`timescale 1ns/1ps

module tb_mux_8_1;

    // Inputs
    reg [7:0] a_1;
    reg [7:0] a_2;
    reg [7:0] a_3;
    reg [7:0] a_4;
    reg [7:0] a_5;
    reg [7:0] a_6;
    reg [7:0] a_7;
    reg [7:0] a_8;
    reg [2:0] sel;

    // Output
    wire [7:0] y;

    // Instantiate the Unit Under Test (UUT)
    mux_8_1 uut (
        .a_1(a_1), 
        .a_2(a_2), 
        .a_3(a_3), 
        .a_4(a_4), 
        .a_5(a_5), 
        .a_6(a_6), 
        .a_7(a_7), 
        .a_8(a_8), 
        .sel(sel), 
        .y(y)
    );

    initial begin
        // Initialize inputs
        a_1 = 8'h01; a_2 = 8'h02; a_3 = 8'h03; a_4 = 8'h04;
        a_5 = 8'h05; a_6 = 8'h06; a_7 = 8'h07; a_8 = 8'h08;
        sel = 3'b000;

        // Test all selections
        #10;
        if (y !== a_1) begin $display("FAIL: Expected %h, got %h for sel=%b", a_1, y, sel); $finish; end
        
        sel = 3'b001; #10;
        if (y !== a_2) begin $display("FAIL: Expected %h, got %h for sel=%b", a_2, y, sel); $finish; end
        
        sel = 3'b010; #10;
        if (y !== a_3) begin $display("FAIL: Expected %h, got %h for sel=%b", a_3, y, sel); $finish; end
        
        sel = 3'b011; #10;
        if (y !== a_4) begin $display("FAIL: Expected %h, got %h for sel=%b", a_4, y, sel); $finish; end
        
        sel = 3'b100; #10;
        if (y !== a_5) begin $display("FAIL: Expected %h, got %h for sel=%b", a_5, y, sel); $finish; end
        
        sel = 3'b101; #10;
        if (y !== a_6) begin $display("FAIL: Expected %h, got %h for sel=%b", a_6, y, sel); $finish; end
        
        sel = 3'b110; #10;
        if (y !== a_7) begin $display("FAIL: Expected %h, got %h for sel=%b", a_7, y, sel); $finish; end
        
        sel = 3'b111; #10;
        if (y !== a_8) begin $display("FAIL: Expected %h, got %h for sel=%b", a_8, y, sel); $finish; end
        
        // Test default case
        sel = 3'bxxx; #10;
        if (y !== 8'h00) begin $display("FAIL: Expected 00, got %h for sel=%b", y, sel); $finish; end

        $display("PASS");
        $finish;
    end

endmodule