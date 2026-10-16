`timescale 1ns/1ps

module tb_pci_frame_en_crit;

    reg frame_en_slow_in;
    reg frame_en_keep_in;
    reg pci_stop_in;
    reg pci_trdy_in;
    wire pci_frame_en_out;

    // Instantiate the module under test (uut)
    pci_frame_en_crit uut (
        .pci_frame_en_out(pci_frame_en_out),
        .frame_en_slow_in(frame_en_slow_in),
        .frame_en_keep_in(frame_en_keep_in),
        .pci_stop_in(pci_stop_in),
        .pci_trdy_in(pci_trdy_in)
    );

    initial begin
        // Initialize inputs
        frame_en_slow_in = 0;
        frame_en_keep_in = 0;
        pci_stop_in = 0;
        pci_trdy_in = 0;

        // Test sequence
        // Test 1: Check when frame_en_slow_in is high
        frame_en_slow_in = 1;
        #10;
        if (pci_frame_en_out !== 1) begin
            $display("FAIL: Test 1 failed, expected pci_frame_en_out = 1");
            $finish;
        end

        // Test 2: Check when frame_en_keep_in, pci_stop_in, and pci_trdy_in are all high
        frame_en_slow_in = 0;
        frame_en_keep_in = 1;
        pci_stop_in = 1;
        pci_trdy_in = 1;
        #10;
        if (pci_frame_en_out !== 1) begin
            $display("FAIL: Test 2 failed, expected pci_frame_en_out = 1");
            $finish;
        end

        // Test 3: Check when only frame_en_keep_in is high
        frame_en_keep_in = 1;
        pci_stop_in = 0;
        pci_trdy_in = 0;
        #10;
        if (pci_frame_en_out !== 0) begin
            $display("FAIL: Test 3 failed, expected pci_frame_en_out = 0");
            $finish;
        end

        // Test 4: Check when frame_en_slow_in is low and all others are low
        frame_en_slow_in = 0;
        frame_en_keep_in = 0;
        pci_stop_in = 0;
        pci_trdy_in = 0;
        #10;
        if (pci_frame_en_out !== 0) begin
            $display("FAIL: Test 4 failed, expected pci_frame_en_out = 0");
            $finish;
        end

        // Test 5: Check when frame_en_keep_in is high and others are low
        frame_en_keep_in = 1;
        #10;
        if (pci_frame_en_out !== 0) begin
            $display("FAIL: Test 5 failed, expected pci_frame_en_out = 0");
            $finish;
        end

        // Test 6: Check when all inputs are high
        frame_en_keep_in = 1;
        pci_stop_in = 1;
        pci_trdy_in = 1;
        #10;
        if (pci_frame_en_out !== 1) begin
            $display("FAIL: Test 6 failed, expected pci_frame_en_out = 1");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule