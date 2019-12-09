namespace :rooms do
 desc 'Create Rooms'
 task create: :environment do
   ROOMS = [
     { room_number: 'A01', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'A02', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'A03', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'A04', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'A05', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'B01', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'B02', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'B03', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'B04', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'B05', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'C01', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'C02', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'C03', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'C04', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'C05', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'D01', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'D02', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'D03', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'D04', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'D05', category: 0, description: 'queen size bed', charged_per_night: 7000.00 },
     { room_number: 'A06', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'A07', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'A08', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'A09', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'A10', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'B06', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'B07', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'B08', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'B09', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'B10', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'C06', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'C07', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'C08', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'C09', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'C10', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'D06', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'D07', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'D08', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'D09', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'D10', category: 1, description: 'queen size bed and pool facing', charged_per_night: 8500.00 },
     { room_number: 'D11', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'D12', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'D13', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'D14', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'D15', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'D16', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'D17', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'D18', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'D19', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'D20', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'E01', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'E02', category: 2, description: 'queen size bed and pool facing', charged_per_night: 12000.00 },
     { room_number: 'E03', category: 3, description: 'queen size bed, pool facing with a gym', charged_per_night: 20000.00 },
     { room_number: 'E04', category: 3, description: 'queen size bed, pool facing with a gym', charged_per_night: 20000.00 },
     { room_number: 'E05', category: 3, description: 'queen size bed, pool facing with a gym', charged_per_night: 20000.00 },
     { room_number: 'E06', category: 3, description: 'queen size bed, pool facing with a gym', charged_per_night: 20000.00 },
     { room_number: 'E07', category: 3, description: 'queen size bed, pool facing with a gym', charged_per_night: 20000.00 },
     { room_number: 'E08', category: 3, description: 'queen size bed, pool facing with a gym', charged_per_night: 20000.00 },
     { room_number: 'E09', category: 3, description: 'queen size bed, pool facing with a gym', charged_per_night: 20000.00 },
     { room_number: 'E10', category: 3, description: 'queen size bed, pool facing with a gym', charged_per_night: 20000.00 }
   ].freeze

   ROOMS.each do |room|
     Room.find_or_create_by(
       room_number: room[:room_number],
       category: room[:category],
       description: room[:description],
       charged_per_night: room[:charged_per_night]
     )
   end
   puts "Created rooms successfully."
 end
end