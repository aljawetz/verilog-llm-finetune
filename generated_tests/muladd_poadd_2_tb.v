`timescale 1ns/1ps

module tb_muladd_poadd;

    reg [31:0] a;
    reg [31:0] b;
    reg [31:0] c;
    wire [63:0] d;

    // Instantiate the module under test (uut)
    muladd_poadd uut (
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    initial begin
        // Test case 1: Simple multiplication and addition
        a = 3; b = 4; c = 5;
        #10;
        if (d !== (a * b + c)) $display("FAIL: Test case 1 failed, expected %d, got %d", (a * b + c), d);

        // Test case 2: Zero multiplication
        a = 0; b = 10; c = 5;
        #10;
        if (d !== (a * b + c)) $display("FAIL: Test case 2 failed, expected %d, got %d", (a * b + c), d);

        // Test case 3: Negative addition
        a = 2; b = 3; c = -1;
        #10;
        if (d !== (a * b + c)) $display("FAIL: Test case 3 failed, expected %d, got %d", (a * b + c), d);

        // Test case 4: Large numbers
        a = 100000; b = 200000; c = 300000;
        #10;
        if (d !== (a * b + c)) $display("FAIL: Test case 4 failed, expected %d, got %d", (a * b + c), d);

        // Test case 5: All inputs zero
        a = 0; b = 0; c = 0;
        #10;
        if (d !== (a * b + c)) $display("FAIL: Test case 5 failed, expected %d, got %d", (a * b + c), d);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule