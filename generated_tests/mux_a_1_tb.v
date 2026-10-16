`timescale 1ns/1ps

module tb_mux_a;

    reg first;
    reg [31:0] a;
    wire [31:0] c;

    // Instantiate the module under test (uut)
    mux_a uut (
        .first(first),
        .a(a),
        .c(c)
    );

    initial begin
        // Test case 1: first is high, expect c to be 0
        first = 1'b1;
        a = 32'hA5A5A5A5; // arbitrary value
        #10; // wait for 10 time units
        if (c !== 32'b0) begin
            $display("FAIL: Test case 1 failed, expected c = 0, got c = %h", c);
            $finish;
        end

        // Test case 2: first is low, expect c to be equal to a
        first = 1'b0;
        #10; // wait for 10 time units
        if (c !== a) begin
            $display("FAIL: Test case 2 failed, expected c = %h, got c = %h", a, c);
            $finish;
        end

        // Test case 3: first is high again, expect c to be 0
        first = 1'b1;
        #10; // wait for 10 time units
        if (c !== 32'b0) begin
            $display("FAIL: Test case 3 failed, expected c = 0, got c = %h", c);
            $finish;
        end

        // Test case 4: first is low again, expect c to be equal to a
        first = 1'b0;
        a = 32'hFFFFFFFF; // another arbitrary value
        #10; // wait for 10 time units
        if (c !== a) begin
            $display("FAIL: Test case 4 failed, expected c = %h, got c = %h", a, c);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule