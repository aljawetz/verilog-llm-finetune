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

        // Test case 1: All inputs low
        #10;
        if (pci_frame_en_out !== 0) begin
            $display("FAIL: Test case 1 failed, expected 0, got %b", pci_frame_en_out);
            $finish;
        end

        // Test case 2: frame_en_slow_in high
        frame_en_slow_in = 1;
        #10;
        if (pci_frame_en_out !== 1) begin
            $display("FAIL: Test case 2 failed, expected 1, got %b", pci_frame_en_out);
            $finish;
        end

        // Test case 3: frame_en_keep_in high, pci_stop_in high, pci_trdy_in high
        frame_en_slow_in = 0;
        frame_en_keep_in = 1;
        pci_stop_in = 1;
        pci_trdy_in = 1;
        #10;
        if (pci_frame_en_out !== 1) begin
            $display("FAIL: Test case 3 failed, expected 1, got %b", pci_frame_en_out);
            $finish;
        end

        // Test case 4: frame_en_keep_in high, pci_stop_in low
        pci_stop_in = 0;
        #10;
        if (pci_frame_en_out !== 0) begin
            $display("FAIL: Test case 4 failed, expected 0, got %b", pci_frame_en_out);
            $finish;
        end

        // Test case 5: frame_en_keep_in high, pci_stop_in high, pci_trdy_in low
        pci_stop_in = 1;
        pci_trdy_in = 0;
        #10;
        if (pci_frame_en_out !== 0) begin
            $display("FAIL: Test case 5 failed, expected 0, got %b", pci_frame_en_out);
            $finish;
        end

        // Test case 6: All inputs high
        pci_stop_in = 1;
        pci_trdy_in = 1;
        #10;
        if (pci_frame_en_out !== 1) begin
            $display("FAIL: Test case 6 failed, expected 1, got %b", pci_frame_en_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule