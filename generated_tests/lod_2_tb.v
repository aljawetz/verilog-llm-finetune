`timescale 1ns/1ps

module tb_lod;

    reg [7:0] data_in;
    wire [2:0] data_out;

    // Instantiate the module under test (uut)
    lod uut (
        .data_in(data_in),
        .data_out(data_out)
    );

    initial begin
        // Test case 1: data_in = 8'b10000000
        data_in = 8'b10000000; #10;
        if (data_out !== 3'b111) begin
            $display("FAIL: Expected 3'b111 for input 8'b10000000, got %b", data_out);
            $finish;
        end

        // Test case 2: data_in = 8'b01000000
        data_in = 8'b01000000; #10;
        if (data_out !== 3'b110) begin
            $display("FAIL: Expected 3'b110 for input 8'b01000000, got %b", data_out);
            $finish;
        end

        // Test case 3: data_in = 8'b00100000
        data_in = 8'b00100000; #10;
        if (data_out !== 3'b101) begin
            $display("FAIL: Expected 3'b101 for input 8'b00100000, got %b", data_out);
            $finish;
        end

        // Test case 4: data_in = 8'b00010000
        data_in = 8'b00010000; #10;
        if (data_out !== 3'b100) begin
            $display("FAIL: Expected 3'b100 for input 8'b00010000, got %b", data_out);
            $finish;
        end

        // Test case 5: data_in = 8'b00001000
        data_in = 8'b00001000; #10;
        if (data_out !== 3'b011) begin
            $display("FAIL: Expected 3'b011 for input 8'b00001000, got %b", data_out);
            $finish;
        end

        // Test case 6: data_in = 8'b00000100
        data_in = 8'b00000100; #10;
        if (data_out !== 3'b010) begin
            $display("FAIL: Expected 3'b010 for input 8'b00000100, got %b", data_out);
            $finish;
        end

        // Test case 7: data_in = 8'b00000010
        data_in = 8'b00000010; #10;
        if (data_out !== 3'b001) begin
            $display("FAIL: Expected 3'b001 for input 8'b00000010, got %b", data_out);
            $finish;
        end

        // Test case 8: data_in = 8'b00000001
        data_in = 8'b00000001; #10;
        if (data_out !== 3'b000) begin
            $display("FAIL: Expected 3'b000 for input 8'b00000001, got %b", data_out);
            $finish;
        end

        // Test case 9: data_in = 8'b00000000
        data_in = 8'b00000000; #10;
        if (data_out !== 3'b000) begin
            $display("FAIL: Expected 3'b000 for input 8'b00000000, got %b", data_out);
            $finish;
        end

        $display("PASS");
        $finish;
    end

endmodule