`timescale 1ns/1ps

module tb_pci_frame_crit;

    reg force_frame_in;
    reg slow_frame_in;
    reg pci_stop_in;
    wire pci_frame_out;

    // Instantiate the module under test (uut)
    pci_frame_crit uut (
        .pci_frame_out(pci_frame_out),
        .force_frame_in(force_frame_in),
        .slow_frame_in(slow_frame_in),
        .pci_stop_in(pci_stop_in)
    );

    initial begin
        // Initialize inputs
        force_frame_in = 0;
        slow_frame_in = 0;
        pci_stop_in = 0;

        // Test case 1: force_frame_in = 0, expect pci_frame_out = 0
        #10;
        if (pci_frame_out !== 0) begin
            $display("FAIL: Test case 1 failed, expected pci_frame_out = 0");
            $finish;
        end

        // Test case 2: force_frame_in = 1, slow_frame_in = 0, pci_stop_in = 1, expect pci_frame_out = 0
        force_frame_in = 1; slow_frame_in = 0; pci_stop_in = 1;
        #10;
        if (pci_frame_out !== 0) begin
            $display("FAIL: Test case 2 failed, expected pci_frame_out = 0");
            $finish;
        end

        // Test case 3: force_frame_in = 1, slow_frame_in = 1, pci_stop_in = 1, expect pci_frame_out = 1
        slow_frame_in = 1; pci_stop_in = 1;
        #10;
        if (pci_frame_out !== 1) begin
            $display("FAIL: Test case 3 failed, expected pci_frame_out = 1");
            $finish;
        end

        // Test case 4: force_frame_in = 1, slow_frame_in = 1, pci_stop_in = 0, expect pci_frame_out = 1
        pci_stop_in = 0;
        #10;
        if (pci_frame_out !== 1) begin
            $display("FAIL: Test case 4 failed, expected pci_frame_out = 1");
            $finish;
        end

        // Test case 5: force_frame_in = 1, slow_frame_in = 0, pci_stop_in = 0, expect pci_frame_out = 1
        slow_frame_in = 0; pci_stop_in = 0;
        #10;
        if (pci_frame_out !== 1) begin
            $display("FAIL: Test case 5 failed, expected pci_frame_out = 1");
            $finish;
        end

        // Test case 6: force_frame_in = 0, slow_frame_in = 1, pci_stop_in = 0, expect pci_frame_out = 0
        force_frame_in = 0; slow_frame_in = 1; pci_stop_in = 0;
        #10;
        if (pci_frame_out !== 0) begin
            $display("FAIL: Test case 6 failed, expected pci_frame_out = 0");
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule