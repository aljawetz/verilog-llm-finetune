`timescale 1ns/1ps

module tb_top_module;

    // Inputs
    reg [4:1] x;

    // Outputs
    wire f;

    // Instantiate the Unit Under Test (UUT)
    top_module uut (
        .x(x), 
        .f(f)
    );

    initial begin
        // Test case 1: x = 4'b1000 (x[3]=1, x[1]=0) => f should be 1
        x = 4'b1000; #10;
        if (f !== 1) $display("FAIL: Test case 1 failed, expected f=1, got f=%b", f);

        // Test case 2: x = 4'b0100 (x[3]=0, x[1]=1) => f should be 0
        x = 4'b0100; #10;
        if (f !== 0) $display("FAIL: Test case 2 failed, expected f=0, got f=%b", f);

        // Test case 3: x = 4'b1100 (x[4]=1, x[2]=1) => f should be 1
        x = 4'b1100; #10;
        if (f !== 1) $display("FAIL: Test case 3 failed, expected f=1, got f=%b", f);

        // Test case 4: x = 4'b0000 (x[3]=0, x[1]=0, x[4]=0, x[2]=0) => f should be 0
        x = 4'b0000; #10;
        if (f !== 0) $display("FAIL: Test case 4 failed, expected f=0, got f=%b", f);

        // Test case 5: x = 4'b1110 (x[4]=1, x[2]=1, x[3]=1, x[1]=0) => f should be 1
        x = 4'b1110; #10;
        if (f !== 1) $display("FAIL: Test case 5 failed, expected f=1, got f=%b", f);

        // Test case 6: x = 4'b1010 (x[3]=1, x[1]=0) => f should be 1
        x = 4'b1010; #10;
        if (f !== 1) $display("FAIL: Test case 6 failed, expected f=1, got f=%b", f);

        // Test case 7: x = 4'b0110 (x[4]=0, x[2]=1, x[3]=0, x[1]=1) => f should be 0
        x = 4'b0110; #10;
        if (f !== 0) $display("FAIL: Test case 7 failed, expected f=0, got f=%b", f);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule