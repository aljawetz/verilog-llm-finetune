`timescale 1ns/1ps

module tb_logic_gates;

    reg a;
    reg b;
    wire y0;
    wire y1;
    wire y2;

    // Instantiate the module under test
    logic_gates uut (
        .a(a),
        .b(b),
        .y0(y0),
        .y1(y1),
        .y2(y2)
    );

    initial begin
        // Test case 1: a = 0, b = 0
        a = 0; b = 0;
        #10;
        if (y0 !== 1'b1 || y1 !== 1'b1 || y2 !== 1'b1) 
            $display("FAIL: Test case 1 failed with a=0, b=0");
        
        // Test case 2: a = 0, b = 1
        a = 0; b = 1;
        #10;
        if (y0 !== 1'b1 || y1 !== 1'b1 || y2 !== 1'b0) 
            $display("FAIL: Test case 2 failed with a=0, b=1");
        
        // Test case 3: a = 1, b = 0
        a = 1; b = 0;
        #10;
        if (y0 !== 1'b0 || y1 !== 1'b1 || y2 !== 1'b1) 
            $display("FAIL: Test case 3 failed with a=1, b=0");
        
        // Test case 4: a = 1, b = 1
        a = 1; b = 1;
        #10;
        if (y0 !== 1'b0 || y1 !== 1'b0 || y2 !== 1'b0) 
            $display("FAIL: Test case 4 failed with a=1, b=1");
        
        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule