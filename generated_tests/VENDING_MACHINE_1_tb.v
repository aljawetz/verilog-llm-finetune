`timescale 1ns/1ps

module tb_VENDING_MACHINE;

    reg clk;
    reg reset;
    reg [3:0] deposited_amount;
    reg [1:0] item_code;
    wire dispense;
    wire [3:0] balance;

    // Instantiate the VENDING_MACHINE module
    VENDING_MACHINE uut (
        .clk(clk),
        .reset(reset),
        .deposited_amount(deposited_amount),
        .item_code(item_code),
        .dispense(dispense),
        .balance(balance)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        deposited_amount = 0;
        item_code = 2'b00;
        #10; // Wait for reset to take effect
        reset = 0;

        // Test case 1: Item 0 with sufficient funds
        deposited_amount = 4'd5; // Deposit exactly item_0_price
        item_code = 2'b00; // Select item 0
        #10; // Wait for clock edge
        if (dispense !== 1 || balance !== 4'd0) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: Item 1 with insufficient funds
        deposited_amount = 4'd5; // Deposit less than item_1_price
        item_code = 2'b01; // Select item 1
        #10; // Wait for clock edge
        if (dispense !== 0 || balance !== 4'd5) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: Item 2 with sufficient funds
        deposited_amount = 4'd10; // Deposit exactly item_2_price
        item_code = 2'b10; // Select item 2
        #10; // Wait for clock edge
        if (dispense !== 1 || balance !== 4'd0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: Item 3 with excess funds
        deposited_amount = 4'd15; // Deposit more than item_3_price
        item_code = 2'b11; // Select item 3
        #10; // Wait for clock edge
        if (dispense !== 1 || balance !== 4'd3) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: Reset functionality
        reset = 1; // Assert reset
        #10; // Wait for reset to take effect
        if (dispense !== 0 || balance !== 4'd0) begin
            $display("FAIL: Reset functionality failed");
            $finish;
        end

        // End of tests
        $display("PASS");
        $finish;
    end

endmodule