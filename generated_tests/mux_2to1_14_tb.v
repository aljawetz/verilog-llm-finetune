`timescale 1ns/1ps

module tb_mux_2to1;

    // Inputs
    reg [1:0] d;
    reg s;

    // Output
    wire y;

    // Instantiate the Unit Under Test (UUT)
    mux_2to1 uut (
        .d(d),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: Select input d[0]
        d = 2'b00; s = 1'b0; #10;
        if (y !== 1'b0) $display("FAIL: Test case 1 failed, expected y=0, got y=%b", y);

        // Test case 2: Select input d[1]
        d = 2'b01; s = 1'b1; #10;
        if (y !== 1'b1) $display("FAIL: Test case 2 failed, expected y=1, got y=%b", y);

        // Test case 3: Select input d[0] with different values
        d = 2'b10; s = 1'b0; #10;
        if (y !== 1'b0) $display("FAIL: Test case 3 failed, expected y=0, got y=%b", y);

        // Test case 4: Select input d[1] with different values
        d = 2'b11; s = 1'b1; #10;
        if (y !== 1'b1) $display("FAIL: Test case 4 failed, expected y=1, got y=%b", y);

        // Test case 5: Select input d[0] with both inputs high
        d = 2'b11; s = 1'b0; #10;
        if (y !== 1'b1) $display("FAIL: Test case 5 failed, expected y=1, got y=%b", y);

        // Test case 6: Select input d[1] with both inputs low
        d = 2'b00; s = 1'b1; #10;
        if (y !== 1'b0) $display("FAIL: Test case 6 failed, expected y=0, got y=%b", y);

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule