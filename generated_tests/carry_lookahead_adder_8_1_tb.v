`timescale 1ns/1ps

module tb_carry_lookahead_adder_8;

    reg [7:0] in1;
    reg [7:0] in2;
    reg cin;
    wire [7:0] sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    carry_lookahead_adder_8 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2),
        .cin(cin)
    );

    initial begin
        // Test case 1: 0 + 0 + 0
        in1 = 8'b00000000; 
        in2 = 8'b00000000; 
        cin = 1'b0;
        #10;
        if (sum !== 8'b00000000 || cout !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: 1 + 1 + 0
        in1 = 8'b00000001; 
        in2 = 8'b00000001; 
        cin = 1'b0;
        #10;
        if (sum !== 8'b00000010 || cout !== 1'b0) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: 255 + 1 + 0
        in1 = 8'b11111111; 
        in2 = 8'b00000001; 
        cin = 1'b0;
        #10;
        if (sum !== 8'b00000000 || cout !== 1'b1) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: 15 + 15 + 1
        in1 = 8'b00001111; 
        in2 = 8'b00001111; 
        cin = 1'b1;
        #10;
        if (sum !== 8'b00011111 || cout !== 1'b0) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: 100 + 100 + 0
        in1 = 8'b01100100; 
        in2 = 8'b01100100; 
        cin = 1'b0;
        #10;
        if (sum !== 8'b11001000 || cout !== 1'b0) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: 50 + 50 + 1
        in1 = 8'b00110010; 
        in2 = 8'b00110010; 
        cin = 1'b1;
        #10;
        if (sum !== 8'b01100101 || cout !== 1'b0) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule