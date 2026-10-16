`timescale 1ns/1ps

module tb_pci_frame_en_crit;

    // Inputs
    reg frame_en_slow_in;
    reg frame_en_keep_in;
    reg pci_stop_in;
    reg pci_trdy_in;

    // Output
    wire pci_frame_en_out;

    // Instantiate the Unit Under Test (UUT)
    pci_frame_en_crit uut (
        .pci_frame_en_out(pci_frame_en_out),
        .frame_en_slow_in(frame_en_slow_in),
        .frame_en_keep_in(frame_en_keep_in),
        .pci_stop_in(pci_stop_in),
        .pci_trdy_in(pci_trdy_in)
    );

    initial begin
        // Initialize Inputs
        frame_en_slow_in = 0;
        frame_en_keep_in = 0;
        pci_stop_in = 0;
        pci_trdy_in = 0;

        // Wait for global reset to finish
        #10;

        // Test case 1: frame_en_slow_in is high
        frame_en_slow_in = 1;
        #10;
        if (pci_frame_en_out !== 1) begin
            $display("FAIL: Test case 1 failed");
            $finish;
        end

        // Test case 2: frame_en_slow_in is low, but all other inputs are high
        frame_en_slow_in = 0;
        frame_en_keep_in = 1;
        pci_stop_in = 1;
        pci_trdy_in = 1;
        #10;
        if (pci_frame_en_out !== 1) begin
            $display("FAIL: Test case 2 failed");
            $finish;
        end

        // Test case 3: frame_en_slow_in is low, one input is low
        frame_en_keep_in = 1;
        pci_stop_in = 0; // Set one input low
        pci_trdy_in = 1;
        #10;
        if (pci_frame_en_out !== 0) begin
            $display("FAIL: Test case 3 failed");
            $finish;
        end

        // Test case 4: All inputs low
        frame_en_slow_in = 0;
        frame_en_keep_in = 0;
        pci_stop_in = 0;
        pci_trdy_in = 0;
        #10;
        if (pci_frame_en_out !== 0) begin
            $display("FAIL: Test case 4 failed");
            $finish;
        end

        // Test case 5: frame_en_keep_in is high, others low
        frame_en_keep_in = 1;
        pci_stop_in = 0;
        pci_trdy_in = 0;
        #10;
        if (pci_frame_en_out !== 0) begin
            $display("FAIL: Test case 5 failed");
            $finish;
        end

        // Test case 6: All inputs high
        frame_en_slow_in = 1;
        frame_en_keep_in = 1;
        pci_stop_in = 1;
        pci_trdy_in = 1;
        #10;
        if (pci_frame_en_out !== 1) begin
            $display("FAIL: Test case 6 failed");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule