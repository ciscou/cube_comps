class AddEventsToCompetitions < ActiveRecord::Migration
  def change
    add_column :competitions, :has_event_333,    :boolean
    add_column :competitions, :has_event_444,    :boolean
    add_column :competitions, :has_event_555,    :boolean
    add_column :competitions, :has_event_222,    :boolean
    add_column :competitions, :has_event_333bf,  :boolean
    add_column :competitions, :has_event_333oh,  :boolean
    add_column :competitions, :has_event_333fm,  :boolean
    add_column :competitions, :has_event_333ft,  :boolean
    add_column :competitions, :has_event_minx,   :boolean
    add_column :competitions, :has_event_pyram,  :boolean
    add_column :competitions, :has_event_sq1,    :boolean
    add_column :competitions, :has_event_clock,  :boolean
    add_column :competitions, :has_event_666,    :boolean
    add_column :competitions, :has_event_777,    :boolean
    add_column :competitions, :has_event_magic,  :boolean
    add_column :competitions, :has_event_mmagic, :boolean
    add_column :competitions, :has_event_444bf,  :boolean
    add_column :competitions, :has_event_555bf,  :boolean
    add_column :competitions, :has_event_333mbf, :boolean
  end
end
