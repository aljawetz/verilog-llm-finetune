`timescale 1ns/1ps

module tb_pci_io_mux_ad_load_crit;

    reg load_in;
    reg load_on_transfer_in;
    reg pci_irdy_in;
    reg pci_trdy_in;
    wire load_out;

    // Instantiate the module under test (uut)
    pci_io_mux_ad_load_crit uut (
        .load_in(load_in),
        .load_on_transfer_in(load_on_transfer_in),
        .pci_irdy_in(pci_irdy_in),
        .pci_trdy_in(pci_trdy_in),
        .load_out(load_out)
    );

    initial begin
        // Initialize inputs
        load_in = 0;
        load_on_transfer_in = 0;
        pci_irdy_in = 0;
        pci_trdy_in = 0;

        // Test case 1: load_in is high
        load_in = 1;
        #10;
        if (load_out !== 1) begin
            $display("FAIL: Test case 1 failed, expected load_out = 1, got %b", load_out);
            $finish;
        end

        // Test case 2: load_in is low, load_on_transfer_in is high, pci_irdy_in and pci_trdy_in are low
        load_in = 0;
        load_on_transfer_in = 1;
        pci_irdy_in = 0;
        pci_trdy_in = 0;
        #10;
        if (load_out !== 1) begin
            $display("FAIL: Test case 2 failed, expected load_out = 1, got %b", load_out);
            $finish;
        end

        // Test case 3: load_in is low, load_on_transfer_in is high, pci_irdy_in is high, pci_trdy_in is low
        load_in = 0;
        load_on_transfer_in = 1;
        pci_irdy_in = 1;
        pci_trdy_in = 0;
        #10;
        if (load_out !== 0) begin
            $display("FAIL: Test case 3 failed, expected load_out = 0, got %b", load_out);
            $finish;
        end

        // Test case 4: load_in is low, load_on_transfer_in is high, pci_irdy_in is low, pci_trdy_in is high
        load_in = 0;
        load_on_transfer_in = 1;
        pci_irdy_in = 0;
        pci_trdy_in = 1;
        #10;
        if (load_out !== 0) begin
            $display("FAIL: Test case 4 failed, expected load_out = 0, got %b", load_out);
            $finish;
        end

        // Test case 5: load_in is low, load_on_transfer_in is low
        load_in = 0;
        load_on_transfer_in = 0;
        pci_irdy_in = 0;
        pci_trdy_in = 0;
        #10;
        if (load_out !== 0) begin
            $display("FAIL: Test case 5 failed, expected load_out = 0, got %b", load_out);
            $finish;
        end

        // If all tests pass
        $display("PASS");
        $finish;
    end

endmodule