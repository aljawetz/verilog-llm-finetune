`timescale 1ns/1ps

module tb_tx_interrupt_selection;

    // Parameters
    reg [2:0] src_sel;
    reg s00_axis_tlast;
    reg phy_tx_start;
    reg tx_start_from_acc;
    reg tx_end_from_acc;
    reg tx_try_complete;
    wire tx_itrpt;

    // Instantiate the module under test (uut)
    tx_interrupt_selection uut (
        .src_sel(src_sel),
        .s00_axis_tlast(s00_axis_tlast),
        .phy_tx_start(phy_tx_start),
        .tx_start_from_acc(tx_start_from_acc),
        .tx_end_from_acc(tx_end_from_acc),
        .tx_try_complete(tx_try_complete),
        .tx_itrpt(tx_itrpt)
    );

    initial begin
        // Initialize inputs
        src_sel = 3'b000;
        s00_axis_tlast = 0;
        phy_tx_start = 0;
        tx_start_from_acc = 0;
        tx_end_from_acc = 0;
        tx_try_complete = 0;

        // Test case 1: src_sel = 3'b000
        s00_axis_tlast = 1;
        #10;
        if (tx_itrpt !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: src_sel = 3'b001
        src_sel = 3'b001;
        phy_tx_start = 1;
        #10;
        if (tx_itrpt !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: src_sel = 3'b010
        src_sel = 3'b010;
        tx_start_from_acc = 1;
        #10;
        if (tx_itrpt !== 1) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: src_sel = 3'b011
        src_sel = 3'b011;
        tx_end_from_acc = 1;
        #10;
        if (tx_itrpt !== 1) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: src_sel = 3'b100
        src_sel = 3'b100;
        tx_try_complete = 1;
        #10;
        if (tx_itrpt !== 1) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: default case
        src_sel = 3'b111; // Invalid selection
        #10;
        if (tx_itrpt !== 0) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule