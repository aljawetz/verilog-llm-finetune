`timescale 1ns/1ps

module tb_rest_div;
    reg [3:0] x;
    reg [3:0] y;
    wire [3:0] q;
    wire [3:0] r;

    // Instantiate the module under test (uut)
    rest_div uut (
        .x(x),
        .y(y),
        .q(q),
        .r(r)
    );

    initial begin
        // Test case 1: 8 divided by 2
        x = 4'b1000; // 8
        y = 4'b0010; // 2
        #10;
        if (q !== 4'b0100 || r !== 4'b0000) begin
            $display("FAIL: Test case 1 failed (8 / 2)");
            $finish;
        end

        // Test case 2: 9 divided by 3
        x = 4'b1001; // 9
        y = 4'b0011; // 3
        #10;
        if (q !== 4'b0011 || r !== 4'b0000) begin
            $display("FAIL: Test case 2 failed (9 / 3)");
            $finish;
        end

        // Test case 3: 7 divided by 2
        x = 4'b0111; // 7
        y = 4'b0010; // 2
        #10;
        if (q !== 4'b0011 || r !== 4'b0001) begin
            $display("FAIL: Test case 3 failed (7 / 2)");
            $finish;
        end

        // Test case 4: 15 divided by 3
        x = 4'b1111; // 15
        y = 4'b0011; // 3
        #10;
        if (q !== 4'b0101 || r !== 4'b0000) begin
            $display("FAIL: Test case 4 failed (15 / 3)");
            $finish;
        end

        // Test case 5: Division by zero
        x = 4'b1000; // 8
        y = 4'b0000; // 0
        #10;
        if (q !== 4'bxxxx || r !== 4'bxxxx) begin
            $display("FAIL: Test case 5 failed (division by zero)");
            $finish;
        end

        // Test case 6: 0 divided by 5
        x = 4'b0000; // 0
        y = 4'b0101; // 5
        #10;
        if (q !== 4'b0000 || r !== 4'b0000) begin
            $display("FAIL: Test case 6 failed (0 / 5)");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end
endmodule