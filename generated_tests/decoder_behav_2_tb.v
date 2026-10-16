`timescale 1ns/1ps

module tb_decoder_behav;
    reg [2:0] a;
    wire [7:0] y;
    
    // Instantiate the module under test (uut)
    decoder_behav uut (
        .a(a),
        .y(y)
    );

    initial begin
        // Test all possible input values
        a = 3'b000; #10;
        if (y !== 8'b00000001) $display("FAIL: Output for input 000 is incorrect");
        
        a = 3'b001; #10;
        if (y !== 8'b00000010) $display("FAIL: Output for input 001 is incorrect");
        
        a = 3'b010; #10;
        if (y !== 8'b00000100) $display("FAIL: Output for input 010 is incorrect");
        
        a = 3'b011; #10;
        if (y !== 8'b00001000) $display("FAIL: Output for input 011 is incorrect");
        
        a = 3'b100; #10;
        if (y !== 8'b00010000) $display("FAIL: Output for input 100 is incorrect");
        
        a = 3'b101; #10;
        if (y !== 8'b00100000) $display("FAIL: Output for input 101 is incorrect");
        
        a = 3'b110; #10;
        if (y !== 8'b01000000) $display("FAIL: Output for input 110 is incorrect");
        
        a = 3'b111; #10;
        if (y !== 8'b10000000) $display("FAIL: Output for input 111 is incorrect");
        
        // Test default case
        a = 3'bxxx; #10; // Invalid input
        if (y !== 8'b00000000) $display("FAIL: Output for invalid input is incorrect");

        $display("PASS");
        $finish;
    end
endmodule