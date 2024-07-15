package dal;

import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.UsageCount;

public class UsageCountDBContext extends DBContext<UsageCount> {

    @Override
    public void insert(UsageCount model) {
        String sql = "INSERT INTO UsageCount (ID, Count) VALUES (?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, model.getId());
            statement.setInt(2, model.getCount());
            statement.executeUpdate();
        } catch (SQLException e) {
            
        }
    }

    @Override
    public void update(UsageCount model) {
        String sql = "UPDATE UsageCount SET Count = ? WHERE ID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, model.getCount());
            statement.setInt(2, model.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            
        }
    }

    @Override
    public void delete(UsageCount model) {
        String sql = "DELETE FROM UsageCount WHERE ID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, model.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            
        }
    }

    @Override
    public UsageCount get(int id) {
        String sql = "SELECT * FROM UsageCount WHERE ID = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new UsageCount(rs.getInt("ID"), rs.getInt("Count"));
            }
        } catch (SQLException e) {
            
        }
        return null;
    }

    @Override
    public ArrayList<UsageCount> all() {
        ArrayList<UsageCount> usageCounts = new ArrayList<>();
        String sql = "SELECT * FROM UsageCount";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                usageCounts.add(new UsageCount(rs.getInt("ID"), rs.getInt("Count")));
            }
        } catch (SQLException e) {
            
        }
        return usageCounts;
    }
}
