`timescale 1ns/1ps

module tb_fa;

    reg [2:0] people;
    wire [1:0] pop_count;

    // Instantiate the module under test (uut)
    fa uut (
        .people(people),
        .pop_count(pop_count)
    );

    initial begin
        // Test cases
        // Test case 1: 000 -> 0
        people = 3'b000; #10;
        if (pop_count !== 2'b00) begin
            $display("FAIL: Expected pop_count = 00 for people = 000, got %b", pop_count);
            $finish;
        end

        // Test case 2: 001 -> 1
        people = 3'b001; #10;
        if (pop_count !== 2'b01) begin
            $display("FAIL: Expected pop_count = 01 for people = 001, got %b", pop_count);
            $finish;
        end

        // Test case 3: 010 -> 1
        people = 3'b010; #10;
        if (pop_count !== 2'b01) begin
            $display("FAIL: Expected pop_count = 01 for people = 010, got %b", pop_count);
            $finish;
        end

        // Test case 4: 011 -> 2
        people = 3'b011; #10;
        if (pop_count !== 2'b10) begin
            $display("FAIL: Expected pop_count = 10 for people = 011, got %b", pop_count);
            $finish;
        end

        // Test case 5: 100 -> 1
        people = 3'b100; #10;
        if (pop_count !== 2'b01) begin
            $display("FAIL: Expected pop_count = 01 for people = 100, got %b", pop_count);
            $finish;
        end

        // Test case 6: 101 -> 2
        people = 3'b101; #10;
        if (pop_count !== 2'b10) begin
            $display("FAIL: Expected pop_count = 10 for people = 101, got %b", pop_count);
            $finish;
        end

        // Test case 7: 110 -> 2
        people = 3'b110; #10;
        if (pop_count !== 2'b10) begin
            $display("FAIL: Expected pop_count = 10 for people = 110, got %b", pop_count);
            $finish;
        end

        // Test case 8: 111 -> 3
        people = 3'b111; #10;
        if (pop_count !== 2'b11) begin
            $display("FAIL: Expected pop_count = 11 for people = 111, got %b", pop_count);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule