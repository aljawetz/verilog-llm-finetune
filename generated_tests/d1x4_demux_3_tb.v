`timescale 1ns/1ps

module tb_d1x4_demux;

    reg i;
    reg [1:0] s;
    wire [3:0] y;

    // Instantiate the module under test (uut)
    d1x4_demux uut (
        .i(i),
        .s(s),
        .y(y)
    );

    initial begin
        // Test case 1: i = 0, expect y = 0000
        i = 0; s = 2'b00; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 1 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 2: i = 1, s = 00, expect y = 0000
        i = 1; s = 2'b00; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 2 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // Test case 3: i = 1, s = 01, expect y = 0100
        s = 2'b01; #10;
        if (y !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected y = 0100, got y = %b", y);
            $finish;
        end

        // Test case 4: i = 1, s = 10, expect y = 0010
        s = 2'b10; #10;
        if (y !== 4'b0010) begin
            $display("FAIL: Test case 4 failed, expected y = 0010, got y = %b", y);
            $finish;
        end

        // Test case 5: i = 1, s = 11, expect y = 0001
        s = 2'b11; #10;
        if (y !== 4'b0001) begin
            $display("FAIL: Test case 5 failed, expected y = 0001, got y = %b", y);
            $finish;
        end

        // Test case 6: i = 0 again, expect y = 0000
        i = 0; #10;
        if (y !== 4'b0000) begin
            $display("FAIL: Test case 6 failed, expected y = 0000, got y = %b", y);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule