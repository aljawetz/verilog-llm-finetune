`timescale 1ns/1ps

module tb_water_level_indicator;

    reg [7:0] water_level_inputs;
    wire [2:0] water_level_output;

    // Instantiate the module under test (uut)
    water_level_indicator uut (
        .water_level_inputs(water_level_inputs),
        .water_level_output(water_level_output)
    );

    initial begin
        // Test cases
        // Test case 1: Sensor 1 active
        water_level_inputs = 8'b11111110;
        #10;
        if (water_level_output !== 3'b000) begin
            $display("FAIL: Expected 3'b000 for input 8'b11111110, got %b", water_level_output);
            $finish;
        end

        // Test case 2: Sensor 2 active
        water_level_inputs = 8'b11111101;
        #10;
        if (water_level_output !== 3'b001) begin
            $display("FAIL: Expected 3'b001 for input 8'b11111101, got %b", water_level_output);
            $finish;
        end

        // Test case 3: Sensor 3 active
        water_level_inputs = 8'b11111011;
        #10;
        if (water_level_output !== 3'b010) begin
            $display("FAIL: Expected 3'b010 for input 8'b11111011, got %b", water_level_output);
            $finish;
        end

        // Test case 4: Sensor 4 active
        water_level_inputs = 8'b11110111;
        #10;
        if (water_level_output !== 3'b011) begin
            $display("FAIL: Expected 3'b011 for input 8'b11110111, got %b", water_level_output);
            $finish;
        end

        // Test case 5: Sensor 5 active
        water_level_inputs = 8'b11101111;
        #10;
        if (water_level_output !== 3'b100) begin
            $display("FAIL: Expected 3'b100 for input 8'b11101111, got %b", water_level_output);
            $finish;
        end

        // Test case 6: Sensor 6 active
        water_level_inputs = 8'b11011111;
        #10;
        if (water_level_output !== 3'b101) begin
            $display("FAIL: Expected 3'b101 for input 8'b11011111, got %b", water_level_output);
            $finish;
        end

        // Test case 7: Sensor 7 active
        water_level_inputs = 8'b10111111;
        #10;
        if (water_level_output !== 3'b110) begin
            $display("FAIL: Expected 3'b110 for input 8'b10111111, got %b", water_level_output);
            $finish;
        end

        // Test case 8: Sensor 8 active
        water_level_inputs = 8'b01111111;
        #10;
        if (water_level_output !== 3'b111) begin
            $display("FAIL: Expected 3'b111 for input 8'b01111111, got %b", water_level_output);
            $finish;
        end

        // Test case 9: No sensor active
        water_level_inputs = 8'b00000000;
        #10;
        if (water_level_output !== 3'b000) begin
            $display("FAIL: Expected 3'b000 for input 8'b00000000, got %b", water_level_output);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule