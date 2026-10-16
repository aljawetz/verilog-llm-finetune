`timescale 1ns/1ps

module tb_pci_frame_load_crit;

    reg sm_data_phases_in;
    reg frame_load_slow_in;
    reg pci_trdy_in;
    reg pci_stop_in;
    wire pci_frame_load_out;

    // Instantiate the module under test (uut)
    pci_frame_load_crit uut (
        .pci_frame_load_out(pci_frame_load_out),
        .sm_data_phases_in(sm_data_phases_in),
        .frame_load_slow_in(frame_load_slow_in),
        .pci_trdy_in(pci_trdy_in),
        .pci_stop_in(pci_stop_in)
    );

    initial begin
        // Initialize inputs
        sm_data_phases_in = 0;
        frame_load_slow_in = 0;
        pci_trdy_in = 0;
        pci_stop_in = 0;

        // Test case 1: Check output when both inputs are low
        #10;
        if (pci_frame_load_out !== 0) begin
            $display("FAIL: Test case 1 failed, expected 0, got %b", pci_frame_load_out);
            $finish;
        end

        // Test case 2: Check output when frame_load_slow_in is high
        frame_load_slow_in = 1;
        #10;
        if (pci_frame_load_out !== 1) begin
            $display("FAIL: Test case 2 failed, expected 1, got %b", pci_frame_load_out);
            $finish;
        end

        // Test case 3: Check output when sm_data_phases_in is high and pci_trdy_in and pci_stop_in are low
        frame_load_slow_in = 0;
        sm_data_phases_in = 1;
        pci_trdy_in = 0;
        pci_stop_in = 0;
        #10;
        if (pci_frame_load_out !== 1) begin
            $display("FAIL: Test case 3 failed, expected 1, got %b", pci_frame_load_out);
            $finish;
        end

        // Test case 4: Check output when sm_data_phases_in is high and pci_trdy_in and pci_stop_in are high
        pci_trdy_in = 1;
        pci_stop_in = 1;
        #10;
        if (pci_frame_load_out !== 0) begin
            $display("FAIL: Test case 4 failed, expected 0, got %b", pci_frame_load_out);
            $finish;
        end

        // Test case 5: Check output when sm_data_phases_in is low and frame_load_slow_in is high
        sm_data_phases_in = 0;
        frame_load_slow_in = 1;
        #10;
        if (pci_frame_load_out !== 1) begin
            $display("FAIL: Test case 5 failed, expected 1, got %b", pci_frame_load_out);
            $finish;
        end

        // Test case 6: Check output when all inputs are high
        sm_data_phases_in = 1;
        frame_load_slow_in = 1;
        pci_trdy_in = 1;
        pci_stop_in = 1;
        #10;
        if (pci_frame_load_out !== 1) begin
            $display("FAIL: Test case 6 failed, expected 1, got %b", pci_frame_load_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule