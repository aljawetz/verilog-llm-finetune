`timescale 1ns/1ps

module tb_pci_frame_crit;

    // Inputs
    reg force_frame_in;
    reg slow_frame_in;
    reg pci_stop_in;

    // Outputs
    wire pci_frame_out;

    // Instantiate the Unit Under Test (UUT)
    pci_frame_crit uut (
        .pci_frame_out(pci_frame_out),
        .force_frame_in(force_frame_in),
        .slow_frame_in(slow_frame_in),
        .pci_stop_in(pci_stop_in)
    );

    initial begin
        // Initialize Inputs
        force_frame_in = 0;
        slow_frame_in = 0;
        pci_stop_in = 0;

        // Wait for global reset
        #10;

        // Test Case 1: force_frame_in = 1, slow_frame_in = 1, pci_stop_in = 0
        force_frame_in = 1;
        slow_frame_in = 1;
        pci_stop_in = 0;
        #10;
        if (pci_frame_out !== 1) begin
            $display("FAIL: Test Case 1 failed, expected pci_frame_out = 1, got %b", pci_frame_out);
            $finish;
        end

        // Test Case 2: force_frame_in = 1, slow_frame_in = 0, pci_stop_in = 0
        slow_frame_in = 0;
        #10;
        if (pci_frame_out !== 1) begin
            $display("FAIL: Test Case 2 failed, expected pci_frame_out = 1, got %b", pci_frame_out);
            $finish;
        end

        // Test Case 3: force_frame_in = 1, slow_frame_in = 1, pci_stop_in = 1
        pci_stop_in = 1;
        #10;
        if (pci_frame_out !== 0) begin
            $display("FAIL: Test Case 3 failed, expected pci_frame_out = 0, got %b", pci_frame_out);
            $finish;
        end

        // Test Case 4: force_frame_in = 0, slow_frame_in = 1, pci_stop_in = 0
        force_frame_in = 0;
        pci_stop_in = 0;
        #10;
        if (pci_frame_out !== 0) begin
            $display("FAIL: Test Case 4 failed, expected pci_frame_out = 0, got %b", pci_frame_out);
            $finish;
        end

        // Test Case 5: force_frame_in = 0, slow_frame_in = 0, pci_stop_in = 1
        slow_frame_in = 0;
        pci_stop_in = 1;
        #10;
        if (pci_frame_out !== 0) begin
            $display("FAIL: Test Case 5 failed, expected pci_frame_out = 0, got %b", pci_frame_out);
            $finish;
        end

        // Test Case 6: force_frame_in = 1, slow_frame_in = 0, pci_stop_in = 1
        force_frame_in = 1;
        slow_frame_in = 0;
        #10;
        if (pci_frame_out !== 0) begin
            $display("FAIL: Test Case 6 failed, expected pci_frame_out = 0, got %b", pci_frame_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule