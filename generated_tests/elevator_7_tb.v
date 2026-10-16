`timescale 1ns/1ps

module tb_elevator;

    reg clk;
    reg rst;
    reg [4:0] floor_req;
    wire [4:0] floor_pos;

    // Instantiate the elevator module
    elevator uut (
        .clk(clk),
        .rst(rst),
        .floor_req(floor_req),
        .floor_pos(floor_pos)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize
        rst = 1;
        floor_req = 5'b00000;
        #10;
        
        // Release reset
        rst = 0;
        #10;

        // Test case 1: Request floor 3
        floor_req = 5'b00010; // Request floor 2 (0-indexed)
        #50; // Wait for elevator to reach requested floor
        if (floor_pos !== 5'b00010) begin
            $display("FAIL: Expected floor_pos 2, got %b", floor_pos);
            $finish;
        end

        // Test case 2: Request floor 1
        floor_req = 5'b00001; // Request floor 1 (0-indexed)
        #50; // Wait for elevator to reach requested floor
        if (floor_pos !== 5'b00001) begin
            $display("FAIL: Expected floor_pos 1, got %b", floor_pos);
            $finish;
        end

        // Test case 3: Request floor 4
        floor_req = 5'b00100; // Request floor 3 (0-indexed)
        #50; // Wait for elevator to reach requested floor
        if (floor_pos !== 5'b00100) begin
            $display("FAIL: Expected floor_pos 3, got %b", floor_pos);
            $finish;
        end

        // Test case 4: Request floor 0
        floor_req = 5'b00000; // No request
        #10; // Wait a bit
        if (floor_pos !== 5'b00100) begin
            $display("FAIL: Expected floor_pos 3, got %b", floor_pos);
            $finish;
        end

        // Test case 5: Request floor 2
        floor_req = 5'b00010; // Request floor 2 (0-indexed)
        #50; // Wait for elevator to reach requested floor
        if (floor_pos !== 5'b00010) begin
            $display("FAIL: Expected floor_pos 2, got %b", floor_pos);
            $finish;
        end

        // Test case 6: Request floor 4 again
        floor_req = 5'b00100; // Request floor 3 (0-indexed)
        #50; // Wait for elevator to reach requested floor
        if (floor_pos !== 5'b00100) begin
            $display("FAIL: Expected floor_pos 3, got %b", floor_pos);
            $finish;
        end

        // Final check
        floor_req = 5'b00000; // No request
        #10; // Wait a bit
        if (floor_pos !== 5'b00100) begin
            $display("FAIL: Expected floor_pos 3, got %b", floor_pos);
            $finish;
        end

        $display("PASS");
        $finish;
    end
endmodule