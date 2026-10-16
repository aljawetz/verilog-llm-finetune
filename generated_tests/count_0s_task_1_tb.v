`timescale 1ns/1ps

module tb_count_0s_task;

    reg [7:0] d_in;
    wire [3:0] count;

    // Instantiate the module under test (uut)
    count_0s_task uut (
        .d_in(d_in),
        .count(count)
    );

    initial begin
        // Test case 1: All zeros
        d_in = 8'b00000000; // Expect count = 8
        #10;
        if (count !== 4'b1000) begin
            $display("FAIL: Test case 1 failed, expected count = 8, got count = %b", count);
            $finish;
        end

        // Test case 2: All ones
        d_in = 8'b11111111; // Expect count = 0
        #10;
        if (count !== 4'b0000) begin
            $display("FAIL: Test case 2 failed, expected count = 0, got count = %b", count);
            $finish;
        end

        // Test case 3: Mixed values
        d_in = 8'b10101010; // Expect count = 4
        #10;
        if (count !== 4'b0100) begin
            $display("FAIL: Test case 3 failed, expected count = 4, got count = %b", count);
            $finish;
        end

        // Test case 4: One zero
        d_in = 8'b11111110; // Expect count = 1
        #10;
        if (count !== 4'b0001) begin
            $display("FAIL: Test case 4 failed, expected count = 1, got count = %b", count);
            $finish;
        end

        // Test case 5: Two zeros
        d_in = 8'b11001111; // Expect count = 2
        #10;
        if (count !== 4'b0010) begin
            $display("FAIL: Test case 5 failed, expected count = 2, got count = %b", count);
            $finish;
        end

        // Test case 6: Random values
        d_in = 8'b00110011; // Expect count = 4
        #10;
        if (count !== 4'b0100) begin
            $display("FAIL: Test case 6 failed, expected count = 4, got count = %b", count);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule