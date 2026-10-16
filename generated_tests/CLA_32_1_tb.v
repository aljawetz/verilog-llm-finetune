`timescale 1ns/1ps

module tb_CLA_32;

    reg [31:0] in1;
    reg [31:0] in2;
    wire [31:0] sum;
    wire cout;

    CLA_32 uut (
        .sum(sum),
        .cout(cout),
        .in1(in1),
        .in2(in2)
    );

    initial begin
        // Test case 1: 0 + 0 = 0
        in1 = 32'h00000000; 
        in2 = 32'h00000000; 
        #10;
        if (sum !== 32'h00000000 || cout !== 1'b0) 
            $display("FAIL: Test case 1 failed");
        
        // Test case 2: 1 + 1 = 2
        in1 = 32'h00000001; 
        in2 = 32'h00000001; 
        #10;
        if (sum !== 32'h00000002 || cout !== 1'b0) 
            $display("FAIL: Test case 2 failed");
        
        // Test case 3: 2 + 3 = 5
        in1 = 32'h00000002; 
        in2 = 32'h00000003; 
        #10;
        if (sum !== 32'h00000005 || cout !== 1'b0) 
            $display("FAIL: Test case 3 failed");
        
        // Test case 4: 0xFFFFFFFF + 0x00000001 = 0x00000000 with carry
        in1 = 32'hFFFFFFFF; 
        in2 = 32'h00000001; 
        #10;
        if (sum !== 32'h00000000 || cout !== 1'b1) 
            $display("FAIL: Test case 4 failed");
        
        // Test case 5: 0x7FFFFFFF + 0x7FFFFFFF = 0xFFFFFFFE with carry
        in1 = 32'h7FFFFFFF; 
        in2 = 32'h7FFFFFFF; 
        #10;
        if (sum !== 32'hFFFFFFFE || cout !== 1'b1) 
            $display("FAIL: Test case 5 failed");
        
        // Test case 6: 0x80000000 + 0x80000000 = 0x00000000 with carry
        in1 = 32'h80000000; 
        in2 = 32'h80000000; 
        #10;
        if (sum !== 32'h00000000 || cout !== 1'b1) 
            $display("FAIL: Test case 6 failed");
        
        // Test case 7: 0x00000001 + 0xFFFFFFFF = 0x00000000 with carry
        in1 = 32'h00000001; 
        in2 = 32'hFFFFFFFF; 
        #10;
        if (sum !== 32'h00000000 || cout !== 1'b1) 
            $display("FAIL: Test case 7 failed");

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule