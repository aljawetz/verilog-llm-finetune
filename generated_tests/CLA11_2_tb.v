`timescale 1ns/1ps

module tb_CLA11;
    reg [10:0] in1;
    reg [10:0] in2;
    wire [10:0] sum;
    wire cout;

    CLA11 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        in1 = 11'b00000000000; 
        in2 = 11'b00000000000; 
        #10;
        if (sum !== 11'b00000000000 || cout !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: 1 + 1 = 2
        in1 = 11'b00000000001; 
        in2 = 11'b00000000001; 
        #10;
        if (sum !== 11'b00000000010 || cout !== 1'b0) 
            $display("FAIL: Test case 2 failed");

        // Test case 3: 5 + 3 = 8
        in1 = 11'b00000000101; 
        in2 = 11'b00000000011; 
        #10;
        if (sum !== 11'b00000001000 || cout !== 1'b0) 
            $display("FAIL: Test case 3 failed");

        // Test case 4: 1023 + 1 = 1024
        in1 = 11'b11111111111; 
        in2 = 11'b00000000001; 
        #10;
        if (sum !== 11'b00000000000 || cout !== 1'b1) 
            $display("FAIL: Test case 4 failed");

        // Test case 5: 512 + 512 = 1024
        in1 = 11'b00100000000; 
        in2 = 11'b00100000000; 
        #10;
        if (sum !== 11'b00000000000 || cout !== 1'b1) 
            $display("FAIL: Test case 5 failed");

        // Test case 6: 1023 + 1023 = 2046
        in1 = 11'b11111111111; 
        in2 = 11'b11111111111; 
        #10;
        if (sum !== 11'b11111111110 || cout !== 1'b1) 
            $display("FAIL: Test case 6 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule