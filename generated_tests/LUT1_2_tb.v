`timescale 1ns/1ps

module tb_LUT1;

    reg in1, in2, in3;
    wire [2:0] out;
    
    // Instantiate the module under test (uut)
    LUT1 uut (
        .out(out),
        .in1(in1),
        .in2(in2),
        .in3(in3)
    );

    initial begin
        // Test all combinations of in1, in2, in3
        // Expected outputs are based on the LUT1 behavior
        {in3, in2, in1} = 3'b000; #10;
        if (out !== 3'b000) $display("FAIL: Test case 000 failed, got %b", out);
        
        {in3, in2, in1} = 3'b001; #10;
        if (out !== 3'b001) $display("FAIL: Test case 001 failed, got %b", out);
        
        {in3, in2, in1} = 3'b010; #10;
        if (out !== 3'b001) $display("FAIL: Test case 010 failed, got %b", out);
        
        {in3, in2, in1} = 3'b011; #10;
        if (out !== 3'b010) $display("FAIL: Test case 011 failed, got %b", out);
        
        {in3, in2, in1} = 3'b100; #10;
        if (out !== 3'b001) $display("FAIL: Test case 100 failed, got %b", out);
        
        {in3, in2, in1} = 3'b101; #10;
        if (out !== 3'b010) $display("FAIL: Test case 101 failed, got %b", out);
        
        {in3, in2, in1} = 3'b110; #10;
        if (out !== 3'b010) $display("FAIL: Test case 110 failed, got %b", out);
        
        {in3, in2, in1} = 3'b111; #10;
        if (out !== 3'b011) $display("FAIL: Test case 111 failed, got %b", out);
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule